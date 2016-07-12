from system.core.model import Model
from flask import Flask, session

class Poke_Model(Model):
    def __init__(self):
        super(Poke_Model, self).__init__()

    def being_poked(self):
        pass

    def show_others(self):
        query = "SELECT * FROM users WHERE id != :id"
        data = { 'id' : session['id']}
        show_others = self.db.query_db(query,data)
        return (show_others)
    