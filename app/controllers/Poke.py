from system.core.controller import *
from flask import Flask, flash, session

class poke(Controller):
    def __init__(self, action):
        super(poke, self).__init__(action)
        self.load_model('pokeModel')
   
    def poke_summary(self):
        number_of_pokes = self.models['pokeModel'].number_of_pokes()
        #show peopel who poked me
        being_poked = self.models['pokeModel'].being_poked()
        #show other users
        show_others = self.models['pokeModel'].show_others()
        # print ('%' * 25)
        # print show_others[0]
        # print ('%' * 25)
        return self.load_view('poke.html', number_of_pokes=number_of_pokes, being_poked=being_poked, show_others=show_others)

    def poke_me(self, id):
        poke_me = self.models['pokeModel'].poke_me(id)
        # print ('%' * 25)
        # print poke_me
        # print ('%' * 25)
        return redirect ('/poke_summary')