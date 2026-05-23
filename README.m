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
    def __init__(self, player_image, player_y, player_x, player_speed, size):
        super().__init__(player_image, player_y, player_x, player_speed, size)
        self.ammo = 5
        self.last_reload = 0
        self.is_reloading = False
    def update_l(self):
        keys = key.get_pressed()
        if keys[K_d] and self.rect.x < 500 - self.rect.height - 5:
            self.rect.x += self.speed
        if keys[K_a] and self.rect.x > 5:
            self.rect.x -= self.speed
        if keys[K_SPACE]:
            self.fire()
    def update_r(self):
        keys = key.get_pressed()
        if keys[K_d] and self.rect.x < 500 - self.rect.height - 5:
            self.rect.x += self.speed
        if keys[K_a] and self.rect.x > 5:
            self.rect.x -= self.speed
        if keys[K_SPACE]:
            self.fire()        

window = display.set_mode((700, 500))
display.set_caption('Пинг понг')

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
        pass
    display.update() 
    clock.tick(60)
