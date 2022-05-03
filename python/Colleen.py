# Global scope comment

def printer():
	str = "# Global scope comment\n\ndef printer():\n\tstr = %r\n\tprint(str %% (str,))\n\nif __name__ == '__main__':\n\t# Local scope of the main function\n\tprinter()"
	print(str % (str,))

if __name__ == '__main__':
	# Local scope of the main function
	printer()
