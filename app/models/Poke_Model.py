from system.core.model import Model
from flask import Flask, session

class Poke_Model(Model):
    def __init__(self):
        super(Poke_Model, self).__init__()

    def number_of_pokes(self):
        query = "SELECT distinct COUNT(poking) AS counted FROM pokes where being_poked = :id"
        data = { 'id' : session['id'] }
        number_of_pokes = self.db.query_db(query,data)
        print ('7' * 25)
        print number_of_pokes
        print ('7' * 25)
        return (number_of_pokes)

    def being_poked(self):
        query = "SELECT users.first_name, pokes.number_of_poke FROM users JOIN pokes ON users.id = pokes.poking WHERE being_poked = :id ORDER BY number_of_poke DESC;"
        data = {'id' : session['id']}
        being_poked = self.db.query_db(query,data)
        return (being_poked)

    def show_others(self): 
        #this is a long way to go about it, but I think it will work
        query = "SELECT id FROM users"
        runtime = self.db.query_db(query)
        runtime2 = len(runtime)
        # print ('^' * 25)
        # print "number of time to run", runtime
        # print "length", runtime2
        # print ('^' * 25)
        show_others = []

        count = 1

        while (count <= runtime2):
            if count == session['id']:
                # print "count is same as logged on user"
                count = count + 1
            else:
                # print " count is: ", count
                query = "SELECT users.id, users.first_name, users.last_name, users.alias, users.email, sum(pokes.number_of_poke) AS Sumup FROM users LEFT JOIN pokes ON users.id = pokes.being_poked WHERE users.id = :id "
                data = {'id' : count}
                result = self.db.query_db(query,data)
                # print ("result", result)
                if result[0]['Sumup'] == None:
                     result[0]['Sumup'] = 0
                else:
                    result[0]['Sumup'] = int(result[0]['Sumup'])
                    # print result
                # print int(result['sumup'])
                # print result[0]['frist_name']
                # print result[0,'first_name']
                show_others.append(result)
                count = count + 1

        # query = "SELECT users.id, users.first_name, users.last_name, users.alias, users.email, pokes.being_poked, pokes.number_of_poke FROM users LEFT JOIN pokes ON users.id = pokes.being_poked WHERE users.id != :id "
        # data = { 'id' : session['id']}
        # # show_others = self.db.query_db(query,data)
        # print ('^' * 25)
        # print show_others
        # print ('^' * 25)
        # query = "SELECT SUM(number_of_poke) FROM pokes WHERE being_poked =:id"
        # data = {'being_poked_id': id}
        # sum_of_poke
        return (show_others)

    
    def poke_me(self, id):
        query = "SELECT * FROM pokes WHERE being_poked = :poke_me_id AND poking = :poking_id"
        data = { 'poke_me_id' : id, 'poking_id': session['id']}
        poke_me = self.db.query_db(query,data)

        if len(poke_me) == 0:
            #Logged in user have not poked this user need new entry
            query = "INSERT INTO pokes (being_poked, poking, number_of_poke, created_at, updated_at) VALUES (:being_poked, :poking, :number_of_poke, NOW(), NOW())"
            data = {
                'being_poked' : id, 
                'poking': session['id'],
                'number_of_poke': '1'
            }
            #execute insert
            self.db.query_db(query,data)
        else:
            # Logged in user has poked this user need an update of the record
            new_poke = poke_me[0]['number_of_poke'] + 1
            # print ('%' * 25)
            # print "number of pokes before:", new_poke
            # print ('%' * 25)
            query = "UPDATE pokes SET number_of_poke = :number_of_poke, updated_at= NOW() WHERE being_poked = :being_poked AND poking = :poking "
            data = { 
                'number_of_poke': new_poke,
                'being_poked' : id,
                'poking': session['id']
                }
            self.db.query_db(query,data)
        return (poke_me)

