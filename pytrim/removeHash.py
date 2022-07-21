import os


def remove(path):
  files = os.listdir(path)
  for filename in files :
    newname = filename.split("#")[0]
    os.rename(path+filename, path+newname+".png")

remove("../public/assets/clothesFemale/")
remove("../public/assets/clothesMale/")