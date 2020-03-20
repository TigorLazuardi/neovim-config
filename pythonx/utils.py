import re


def snake_case(str):
    if str.isupper():
        return str.lower()
    res = [str[0].lower()]
    for c in str[1:]:
        if c in ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
            res.append('_')
            res.append(c.lower())
        else:
            res.append(c)

    return ''.join(res)


def struct_finder(buffer, line):
    for x in range(0, line):
        y = re.match('^type\s(\w+)\sstruct\s{', buffer[x])
        if y:
            return y.group(1)
        else:
            continue
    else:
        return ''


def space_between_camels(str):
    res = [str[0]]
    for c in str[1:]:
        if c in ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
            res.append(' ')
            res.append(c)
        else:
            res.append(c)

    return ''.join(res)


def get_initials_low(str):
    res = [str[0].lower()]
    for c in str[1:]:
        if c in ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
            res.append(c.lower())
    return ''.joins(res)
