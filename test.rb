a = ["Comedy", "Drama", "Horror", "Western"]
 a.map{|genre| /Comedy|Western/ === genre}.select{|bool| bool == true}[0]

(6..12).include?(9)