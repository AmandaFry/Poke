from system.core.controller import *
from flask import Flask, flash, session

class Poke(Controller):
    def __init__(self, action):
        super(Poke, self).__init__(action)
        self.load_model('Poke_Model')
   
    def poke_summary(self):
        #show peopel who poked me
        being_poked = self.models['Poke_Model'].being_poked()
        #show other users
        show_others = self.models['Poke_Model'].show_others()
        # print ('%' * 25)
        # print show_others
        # print ('%' * 25)
        return self.load_view('poke.html', being_poked=being_poked, show_others=show_others)

    def poke_me(self, id):
        poke_me = self.models['Poke_Model'].poke_me(id)
        # print ('%' * 25)
        # print poke_me
        # print ('%' * 25)
        return redirect ('/poke_summary')