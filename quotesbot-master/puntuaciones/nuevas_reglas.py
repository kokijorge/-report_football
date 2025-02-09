import io
import json
from collections import defaultdict

from reglas_2016 import patterns


#FILE_A_PUNTUAR = "as2017.txt"
FILE_A_PUNTUAR = "as2016.txt"

print ("\n\n\nVAMOS a puntuar " + FILE_A_PUNTUAR)


with io.open(FILE_A_PUNTUAR,"r", encoding="utf-8") as f:
	comments = f.readlines()

def puntua_partido(comments):

	final = defaultdict(lambda: 0)

	for line, comment in enumerate(comments):		
		for p in patterns:
			for key, value in p.puntua(comment).items():
				final[key] += value	
	return final

total = len(comments)
print (total)
for comentario in comments[0:17]:
	print(comentario)

#a = puntua_partido(comentario for comentario in comments[0:total])
a = puntua_partido(comentario for comentario in comments[0:17])
elementos = a.items()
print (elementos)