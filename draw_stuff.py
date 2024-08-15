from turtle import *
# import emoji


# print(emoji.emojize(":thumbs_up:"))

color("blue")
width(3)

def draw_star(size):
    for _ in range(5):
        forward(size)
        right(144)

def draw_square(size):
    for _ in range(4):
        forward(size)
        right(90)

# draw_square(100)

draw_star(150)

mainloop()
