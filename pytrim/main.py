from PIL import Image, ImageDraw
import os
import cv2
import numpy as np

files = os.listdir("raw")
whiteimg = Image.open('white.png')
bodymask = Image.new('L', whiteimg.size, 0)
bddraw = ImageDraw.Draw(bodymask)
bddraw.polygon([(0, 1553), (2000, 1055), (2000, 2000), (0, 2000)], fill=255)
# mant = Image.open("mant.png")
# r, g, b, alpha_mant = mant.split()
# alpha_mant.save("alpha_mant.png")

TTB = Image.open("TshirtsToBg.png")
r, g, b, alpha_TTB = TTB.split()

bgmask = Image.new('L', whiteimg.size, 0)
bgdraw = ImageDraw.Draw(bgmask)
bgdraw.polygon([(0, 1568), (2000, 1070), (2000, 2000), (0, 2000)], fill=255)

def geneImg():
    for filename in files:
        mask = bgmask
        midfile = 'mid/'+filename
        savefile = "../public/assets/compound/background/"+filename
        if filename[0] == "M" or filename[0] == "W":
            mask = bodymask
            savefile = "../public/assets/compound/body/"+filename
        target = Image.open("raw/"+filename)
        img = Image.composite(target, whiteimg, mask)
        img.save(midfile, quality=95)
        
        img = cv2.imread(midfile, -1)
        img[:, :, 3] = np.where(np.all(img == 0, axis=-1), 0, 255) #透明を透明に
        img[:, :, 3] = np.where(np.all(img == 255, axis=-1), 0, 255) #白を透明に
        cv2.imwrite(savefile, img)

        if mask == bgmask:
            mask = alpha_TTB
            savefile = "../public/assets/compound/shirtsBg/"+filename
            target = Image.open("raw/"+filename)
            img = Image.composite(target, whiteimg, mask)
            img.save(midfile, quality=95)
            
            img = cv2.imread(midfile, -1)
            img[:, :, 3] = np.where(np.all(img == 0, axis=-1), 0, 255) #透明を透明に
            img[:, :, 3] = np.where(np.all(img == 255, axis=-1), 0, 255) #白を透明に
            cv2.imwrite(savefile, img)

geneImg()