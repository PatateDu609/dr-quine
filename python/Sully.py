import os

def main():
	nb = 5

	if nb <= 0:
		return

	actual_filename = os.path.basename(__file__)
	filename = f'Sully_{nb}.py'

	if actual_filename == filename:
		nb -= 1
		filename = f'Sully_{nb}.py'

	str = "import os\n\ndef main():\n\tnb = %d\n\n\tif nb <= 0:\n\t\treturn\n\n\tactual_filename = os.path.basename(__file__)\n\tfilename = f'Sully_{nb}.py'\n\n\tif actual_filename == filename:\n\t\tnb -= 1\n\t\tfilename = f'Sully_{nb}.py'\n\n\tstr = %r\n\n\tf = open(filename, 'w')\n\tf.write(str %% (nb, str))\n\tf.close()\n\n\tos.system('python3 Sully_%%d.py' %% (nb,))\n\nif __name__ == '__main__':\n\tmain()\n"

	f = open(filename, 'w')
	f.write(str % (nb, str))
	f.close()

	os.system('python3 Sully_%d.py' % (nb,))

if __name__ == '__main__':
	main()
