#!/home/ruili/anaconda3/bin/python
import pandas as pd
import requests
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import Image
import numpy as np
import scipy.misc
import matplotlib
import shutil
import os

parent_url = "https://storage.googleapis.com/uga-dsp/project3/"

def image_downloader(filename, url_base, dest_dir):
    url = url_base + filename
    r = requests.get(url)
    dest_loc = dest_dir + filename
    with open(dest_loc, "wb") as f:
        f.write(r.content)
    
#text_downloader("train.txt", parent_url+'data/', "../train/data/")
with open("./train.txt", "r") as f:
    counter = 0
    for line in f:
        counter += 1
        if counter == 100:
            print( "%s downloaded..." % (counter))
        h = line.strip()
        if os.path.exists('../train/masks/%s.png'%(h)):
            continue
        image_downloader(h+'.png', parent_url+'masks/', "../train/masks/")
