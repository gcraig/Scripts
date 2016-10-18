#!/usr/bin/python

import re, urllib, time
#from BeautifulSoup import BeautifulSoup

#07-Feb-2015
#starting with a page full of myspace photos
#save the html as myspace_photos.html
#function iterates through all preview photos of 300x300 and saves full size
def get_myspace_photos():
    ctr = 0
    with open("myspace_photos.html") as f:
        for line in f:
            #if tags span mutliple lines and entire file
            #html = line
            #soup = BeautifulSoup(html)
            #tag = soup.find('data-image-url')
            url = re.search(".*data-image-url=\"(.*)(300x300).jpg\".*", line)
            if (url is not None):
                ctr = ctr + 1
                img_url = url.group(1) + "full.jpg"
                #print img_url
                #throttle retrieval
                time.sleep(3)
                img = "full-" + str(ctr) + ".jpg"           
                urllib.urlretrieve(img_url, img)

if __name__ == '__main__':
    print "Getting MySpace Photos ..."
    get_myspace_photos()
