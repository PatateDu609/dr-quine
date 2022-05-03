# This will print itself in Grace_kid.py
filename = 'Grace_kid.py'
str = "# This will print itself in Grace_kid.py\nfilename = 'Grace_kid.py'\nstr = %r\nmain = lambda f: f.write(str %% str)\n\nmain(open(filename, 'w'))\n"
main = lambda f: f.write(str % str)

main(open(filename, 'w'))
