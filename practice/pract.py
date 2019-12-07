
class Dude:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname
    def myfunction(self):
        print(self.firstname, self.lastname)
class Student(Dude):
    def __init__(self, fname, lname, year):
        Dude.__init__(self, fname, lname)
        self.graduateyear = year
    def welcome(self):
        print("hi", self.firstname, self.lastname, "class of", self.graduateyear)
p2 = Student("Joe", "smith", 2199)
p1 = Dude("dude", "mcDude")
p1.myfunction()
p2.welcome()

mytuple = ("apple", "grape", "kii")
myit = iter(mytuple)

for x in mytuple:
    print(x)