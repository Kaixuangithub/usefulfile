
from PyPDF2 import PdfFileMerger

merger = PdfFileMerger()

input1 = open("D:\\useful py code\\DE.pdf", "rb")
input2 = open("D:\\useful py code\\TR.pdf", "rb")

#merger.append(fileobj = input1, pages = (0,1)) #represent 1 page
merger.append(fileobj = input1)
#merger.merge(position = 2, fileobj = input2, pages = (0,1))
merger.append(fileobj = input2)
output = open("D:\\useful py code\\new.pdf", "wb")
merger.write(output)


from PyPDF2 import PdfFileWriter, PdfFileReader
output = PdfFileWriter()
input1 = PdfFileReader(open("D:\\useful py code\\DE.pdf", "rb"))

input1.getNumPages()
output.addPage(input1.getPage(0))
#output.addPage(input1.getPage(1).rotateClockwise(90))
#output.addPage(input1.getPage(2).rotateCounterClockwise(90))


outputStream = file("D:\\useful py code\\new.pdf", "wb")
output.write(outputStream)