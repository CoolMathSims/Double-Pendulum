import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
import os
from matplotlib.animation import PillowWriter

data = np.loadtxt('coord1.dat')

data1 = data[:,:2]
data2 = data[:,2:4]


x1 = data1[:,0]
y1 = data1[:,1]

x2 = data2[:,0]
y2 = data2[:,1]


points = np.asarray([data1,data2])
fig = plt.figure()
ax = fig.add_subplot(111)

ax.axis('off')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_xlim((-4, 4))
ax.set_ylim((-4, 4))

line, = ax.plot([], [], 'o-', lw=2)


def init():
    line.set_data([], [],)

    return line

def animate(i):
    thisx = [0, x1[i], x2[i]]
    thisy = [0, y1[i], y2[i]]

    line.set_data(thisx, thisy)
    ax.set_title('t = %.001fs' % (i*0.01))
    return line

#animate
anim = animation.FuncAnimation(fig, animate, init_func=init,
                              frames=len(points[1]), interval=20, blit=False)

#save
#anim.save('pendulum.mp4', writer = 'ffmpeg', extra_args=['-vcodec', 'libx264'])
plt.show()
