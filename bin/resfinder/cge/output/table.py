#!/usr/bin/env python3
from .orderedset import OrderedSet
from .exceptions import DuplicateKeyError
from .exceptions import LockedObjectError


class TableResults(dict):
    """
        The hit table is created empty.
    """
    def __init__(self, software, version, run_date, run_cmd, id):
        self.software = software
        self.version = version
        self.run_date = run_date
        self.run_cmd = run_cmd
        self.id = id

        self.long = {}
        self.medium = {}
        self.short = {}
        self.databases = {}

    def add_database(self, id, version):
        self.databases[id] = version

    def add_table(self, table_name, copy=False):
        """
            TODO: Implement copy argument
        """
        if(isinstance(table_name, Table)):
            name = table_name.name
        else:
            name = table_name

        if(self.long.get(name, False)):
            raise DuplicateKeyError("All table names need to be unique. An "
                                    "attempt was made to add a table with a "
                                    "name that already exists. The name is:{}."
                                    .format(name))

        if(isinstance(table_name, Table)):
            if(copy):
                raise NotImplementedError()
                # self.long[name] = copy.deepcopy(table_name)
            else:
                self.long[name] = table_name
        else:
            self.long[name] = Table(name)

    def as_txt(self, type, header=True, sep="\t", sort=True, pre_name=""):
        if(type == "long"):
            tr = self.long
        elif(type == "medium"):
            tr = self.medium
        elif(type == "short"):
            tr = self.short
        else:
            raise ValueError("as_text method in TableResults class must be "
                             "called with either 'long', 'medium', or "
                             "'short'. It was called with {}".format(type))

        out_str = ""

        for table_name in tr:
            table_str = tr[table_name].as_txt(header=header, sep=sep, sort=sort)
            out_str += ("{pre}{name}\n{table}\n"
                        .format(pre=pre_name, name=table_name, table=table_str))

        return out_str


    def merge(self, tr2, auto_row_header=False, copy=False):
        """
            Merges another table result object into the calling table results
            instance.

            Table objects with identical names will be merged, as will headers
            within merged tables.

            The other table is copied with copy.deepcopy so that changes to the
            merged tables or changes to the other table does not affect each
            other.

            IMPORTANT: Currently ONLY merges the tables stored in 'self.long'
            IMPORTANT: Table merge function does not copy the table that gets
                       merged. Thus, a change in the table that gets merged
                       will also occur in the merged table.
            TODO: Implement the copy argument to create a deepcopy of the
                  merged table instead of just referencing it.
        """
        if(copy is True):
            raise NotImplementedError()

        for table_name in tr2.long:
            other_tbl = tr2.long[table_name]

            if(table_name not in self.long):
                self.add_table(table_name)
                self.long[table_name] = other_tbl
                continue

            call_tbl = self.long[table_name]

            for row_header in other_tbl:
                # Get row now as row header might change if a row header
                # collision occurs.
                other_row_dict = other_tbl[row_header]

                # Handle row header collisions
                if(row_header in call_tbl):
                    if(auto_row_header is False):
                        raise DuplicateKeyError(
                            "During merge of two table, row headers were "
                            "found not to be unique across the two tables. "
                            "Row headers needs to be renamed or the merge "
                            "method should be called with "
                            "auto_row_header=True. Note auto row headers will "
                            "become incrementing integers.\n"
                            "Calling table: {}\n"
                            "Other table: {}\n"
                            "Row header: {}\n"
                            .format(call_tbl.name, other_tbl.name, row_header))
                    call_tbl._row_header_count += 1
                    row_header = call_tbl._row_header_count

                call_tbl[row_header] = other_row_dict


class Row(dict):
    """
    """
    def __init__(self, table):
        self.table = table
        super(Row, self).__init__()

    def __setitem__(self, col_header, col_val):
        if(not col_header in self.table._headers):
            if(self.table.lock_headers):
                raise LockedObjectError("Attempt to add a header via a Row "
                                        "insertion to a table, where the "
                                        "headers has been locked.\n"
                                        "Table: {}\n"
                                        "Row header, val: {}, {}\n"
                                        "Header: {}\n"
                                        .format(self.name, col_header, col_val,
                                                header))
            self.table.add_header(col_header)

        super(Row, self).__setitem__(col_header, col_val)


class Table(dict):
    """
        Keys of a Table object is considered 'row headers'.
        The Key can be None in which case the row header will become an
        increasing integer (starting at 1).

        Values must be lists of length 2. Where the first entry is the name of
        a column header and the second entry is the value.
    """
    NULL_VAL = "NA"

    def __init__(self, name):
        self.name = name
        self.lock_headers = False

        self._headers = OrderedSet()
        self._row_header_count = 0
        self._sort_key = "row_header"
        self._sort_list = SortList(container=self)
        self._iter_count = 0

    def add_header(self, header, exist_ok=True):
        if(self.lock_headers):
            raise LockedObjectError("Attempt to add a header to an object "
                                    "where the headers has been locked.\n"
                                    "Table: {}\n"
                                    "Header: {}\n".format(self.name, header))

        if(exist_ok is False and header in self._headers):
            raise DuplicateKeyError("Attempt to add header that already exists"
                                    " to table, but the add_header method was "
                                    "called with exist_ok=False.\n"
                                    "Table: {}\n"
                                    "Header: {}\n".format(self.name, header))
        self._headers.add(header)

    def add_headers(self, headers, exist_ok=True):
        for header in headers:
            self.add_header(header, exist_ok)

    def as_txt(self, header=True, sep="\t", sort=True):
        """
        """
        if(sort):
            self.set_sort_key(self._sort_key)

        if(header):
            out_str = ("{sep}{heads}\n"
                       .format(sep=sep, heads=sep.join(self._headers)))
        else:
            out_str = ""

        for row in self:
            row_list = self.get_row_as_list(row, as_txt=True)
            out_str += ("{}\n".format(sep.join(row_list)))

        return out_str


    def extract_column(self, col):
        """
        """
        if(col == "row_header"):
            return list(self.keys())
        if(col not in self._headers):
            raise KeyError("Attempt to extract a column that doesn't exist.\n"
                           "Missing column name: {}\n"
                           "Table name: {}".format(col, self.name))
        column = []
        for entry in self._sort_list:
            row = self[entry._key]
            column.append(row.get(col, Table.NULL_VAL))
        return column

    def get_headers(self):
        """ Returns an OrderedSet """
        return self._headers

    def get_row_as_list(self, row_header, as_txt=False):
        if(row_header not in self):
            raise KeyError("Unable to find the row_header: {}\n"
                           "In Table object named: {}"
                           .format(row_header, self.name))

        if(as_txt):
            row_list = [str(row_header)]
        else:
            row_list = [row_header]

        for col_header in self._headers:
            if(as_txt):
                row_list.append(str(
                    self[row_header].get(col_header, Table.NULL_VAL)))
            else:
                row_list.append(
                    self[row_header].get(col_header, Table.NULL_VAL))

        return row_list

    def get_sort_list(self):
        """
        """
        if(self._sort_key is None):
            raise TypeError("The sort key is None. The sort key needs to be "
                            "set before calling the get_sort_list method.\n"
                            "Table: {}".format(self.name))
        return self._sort_list

    def rename_row(self, old_name, new_name):
        """
        """
        row_dict = self[old_name]
        del(self[old_name])
        self._sort_list.remove(old_name)
        self[new_name] = row_dict

    def set_sort_key(self, key, sort=True):
        """
        """
        if(key not in self._headers and key != "row_header"):
            raise KeyError("Attempt to set sort_key to a value that is not a "
                           "header.\n"
                           "Key: {}\n"
                           "Available headers: {}\n"
                           "Table name: {}"
                           .format(key, self._headers, self.name))

        self._sort_key = key

        for i, entry in enumerate(self._sort_list):
            if(self._sort_key == "row_header"):
                entry._val = entry._key
            else:
                row = self[entry._key]
                entry._val = row.get(self._sort_key, Table.NULL_VAL)
            self._sort_list[i] = entry

        if(sort is True):
            self._sort_list.sort()

    def set_sort_list(self, list):
        """
        """
        if(_sort_key is None):
            raise TypeError("The sort key is None. The sort key needs to be "
                            "set before calling the set_sort_list method.\n"
                            "Table: {}".format(self.name))
        self._sort_list = list

    def __iter__(self):
        """
        """
        self._iter_count = 0
        return self

    def __next__(self):
        """
        """
        if(self._iter_count >= len(self)):
            raise StopIteration
        entry = self._sort_list[self._iter_count]
        self._iter_count += 1
        return entry._key

    def __setitem__(self, row_header=None, col_val=None):
        """
            TODO
        """
        if(col_val is None):
            raise TypeError("Column key/value argument must be a dict, list or"
                            " tuple. Value was None.\n"
                            "Table: {}".format(self.name))

        if(row_header is None):
            row_header = self._row_header_count
            self._row_header_count += 1

        row_dict = self.get(row_header, Row(table=self))

        # If row is not new. Sort key has been added to the sort list
        # previously.
        sort_key_added = True
        if(not row_dict):
            # If row is new a sort key needs to be added to the sort list.
            sort_key_added = False
            if(self._sort_key == "row_header"):
                self._sort_list.append(row_header, row_header, ignore_len=True)
                sort_key_added = True

        # Several values must be added as a dict.
        if(isinstance(col_val, dict)):
            for col_name, val in col_val.items():
                if(col_name not in self._headers):
                    self.add_header(col_name)
                # Add sort key if needed
                if(self._sort_key == col_name and sort_key_added is False):
                    self._sort_list.append(row_header, val, ignore_len=True)
                    sort_key_added = True
                row_dict[col_name] = val
            # Add sort key if needed
            if(not sort_key_added):
                self._sort_list.append(row_header, Table.NULL_VAL,
                                       ignore_len=True)
            return super(Table, self).__setitem__(row_header, row_dict)

        # A single cell value in a table can be added using a list or tuple.
        if(isinstance(col_val, list) or isinstance(col_val, tuple)):
            if(len(col_val) == 2):
                if(col_val[0] not in self._headers):
                    self.add_header(col_val[0])
                row_dict[col_val[0]] = col_val[1]
                return super(Table, self).__setitem__(row_header, row_dict)
            else:
                raise ValueError("Unexpected number of values. Expected 2. "
                                 "Got: {}\n"
                                 "Input: {}\n"
                                 "Table: {}".format(len(col_val), col_val,
                                                    self.name))

        raise TypeError("Unexpected type. The value must be of the type Row, "
                        "list, or tuple.\n"
                        "Recieved type: {}\n"
                        "Table: {}\n".format(type(col_name), self.name))


class ColumnHeader():
    def __init__(self, table, header):
        """
        """
        table._col_header_count += 1
        self._header = header
        self._index = table._col_header_count

    def __cmp__(self, other):
        if(not isinstance(other, ColumnHeader)):
            raise TypeError("A ColumnHeader object cannot be compared to a "
                            "non-ColumnHeader object.\n"
                            "ColumnHeader _header: {} _index: {}\n"
                            "Other object was of type: {}"
                            .format(self._header, self._index, type(other)))
        return super(ColumnHeader, self._index).__cmp__(other._index)


class SortList(list):
    """
        Used together with the Table class, as a way to extract rows/data in a
        specific order defined by objects of the type SortList.

        Programmers are meant to sort this list in the desired order and store
        it in a Table class object which will then output rows/data in the
        order defined by the list.

        Implementations details:
        The SortList object contain SortListEntries containing key variables
        with unique values which define the order. And value variables which
        is the 'public' values used to sort on.
    """
    def __init__(self, container=None, unique_list=None, val_list=None):
        self.container = None
        if(container is not None):
            self.container = container

        if(unique_list is None and val_list is None):
            return
        if(len(unique_list) != len(val_list)):
            raise IndexError("A SortList object was initiated with two lists "
                             "of different sizes.\n"
                             "len(unique_list) {} != {} len(val_list)"
                             .format(len(unique_list), len(val_list)))

        for i, val in enumerate(val_list):
            self.append(unique_list[i], val)

    def append(self, key, val, ignore_len=False):
        entry = SortListEntry(key, val)
        if(self.container is not None and ignore_len is False):
            if(len(self.container) != (len(self) + 1)):
                raise IndexError("Attempt to add an entry to SortList which "
                                 "would cause the list to be longer than the "
                                 "affiliated SortList container.")
        return super(SortList, self).append(entry)

    def remove(self, id):
        """
        """
        for i, entry in enumerate(self):
            if(id == entry._key):
                del(self[i])

    def __repr__(self):
        outstr_list = []
        for entry in self:
            outstr_list.append("{}\t{}".format(entry._key, entry._val))
        return "\n".join(outstr_list)


class SortListEntry():
    """
    """
    def __init__(self, key, val):
        self._key = key
        self._val = val

    def __cmp__(self, other):
        if(not isinstance(other, SortListEntry)):
            raise TypeError("A SortListEntry object cannot be compared to a "
                            "non-SortListEntry object.\n"
                            "SortListEntry key: {} val: {}\n"
                            "Other object was of type: {}"
                            .format(self._key, self._val, type(other)))

        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__cmp__(sort_val_other)

    def __repr__(self):
        return "{},{}".format(self._key, self._val)

    def __lt__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__lt__(sort_val_other)

    def __le__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__le__(sort_val_other)

    def __gt__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__gt__(sort_val_other)

    def __ge__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__ge__(sort_val_other)

    def __eq__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__eq__(sort_val_other)

    def __ne__(self, other):
        sort_val = str(self._val).lower()
        sort_val_other = str(other._val).lower()
        return sort_val.__ne__(sort_val_other)
