import matplotlib.pyplot as plt
import numpy as np


class GreenVisualize(object):
	"""docstring for GreenVisualize"""
	x = []
	y = []

	def __init__(self, arg):
		pass

	def setXValues(self, x):
		self.x = x

	def setYValue(self, y):
		self.y = y	

	def setXLabel(self, label):
		self.xlabel = label	

	def setTtitle(self, title):
		self.title = title	

	def barchart(self):
		y_size = np.arrange(len(self.y))

		fig, ax = plt.subplots()
		ax.barh(y_size, self.x)
		ax.set_yticks(y_size)
		ax.set_xlabel(self.xlabel)
		ax.set_title(self.title)

		plt.show()

	def getColumn(self, columnID=[]):
			


