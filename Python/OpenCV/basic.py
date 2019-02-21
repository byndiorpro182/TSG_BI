import numpy as np
import cv2
import matplotlib.pyplot as plt

img = cv2.imread('digits520x300_20x10_26x30.png',0)



cells = [np.hsplit(row,20) for row in np.vsplit(img,10)]

x = np.array(cells)
train = x[:,:15].reshape(-1,780).astype(np.float32)
test  = x[:, 15:20].reshape(-1,780).astype(np.float32)
k = np.arange(10)
train_labels = np.repeat(k,15)[:, np.newaxis]

knn = cv2.ml.KNearest_create()
knn.train(train, 0, train_labels)
result = knn.findNearest(test,5)
#print(k)
'''
cv2.imshow('abc',img)
cv2.waitKey(0)
cv2.destroyAllWindows()
'''