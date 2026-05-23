from pygame import *
from random import randint
class GameSprite(sprite.Sprite):
    def __init__(self, player_image, player_y, player_x, player_speed, size):
        super().__init__()
        self.image = transform.scale(image.load(player_image), size)
        self.speed = player_speed
        self.rect = self.image.get_rect()
        self.rect.y = player_y
        self.rect.x = player_x
    def reset(self):
        window.blit(self.image, (self.rect.x, self.rect.y))
class Player(GameSprite):
    def update_l(self):
        keys = key.get_pressed()
        if keys[K_d] and self.rect.x < 700 - self.rect.width - 5:
            self.rect.x += self.speed
        if keys[K_a] and self.rect.x > 5:
            self.rect.x -= self.speed
    def update_r(self):
        keys = key.get_pressed()
        if keys[K_d] and self.rect.x < 700 - self.rect.width - 500:
            self.rect.x += self.speed
        if keys[K_a] and self.rect.x > 5:
            self.rect.x -= self.speed    

window = display.set_mode((700, 500))
display.set_caption('Пинг понг')
palka1 = ('Без названия.png')
palka2 = ()
hero = ('', 500 - 80 - 5,700 // 2, 5,(60, 80))


clock = time.Clock()
FPS = 60
run = True
finish = False

font.init()
my_font = font.SysFont("Arial", 35)
win = my_font.render("Вы победили!", True, (255, 255, 0))
lose_lost = my_font.render("Вы пропустили слишком много тарелок!", True, (255, 0, 0))
lose_walls = my_font.render("Вас сбили!", True, (255, 0, 0))
while run:
    for e  in event.get():
        if e.type == QUIT:
            run = False
    window.blit(background,(0, 0))
    draw_lost(lost)
    draw_score(0)
    if not finish:
        update_l()
        update_r()
    display.update() 
    clock.tick(60)

