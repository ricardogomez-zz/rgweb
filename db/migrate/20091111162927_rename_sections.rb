#1. inicio, el mapa
#2. webs amigas, lo de antes "para viajar"
#3. Para leer como está
#No, no. mejor: lo de "para leer" va al nuevo "conferencias"
#4. "Para leer", vacío
#5. "mis libros", como está
#6. "premios" y "biografía", como está.
#7. "encuentros" y "matemáticas", vacía
#8. "contactos", como está
#9. "el sáhara", vacía
#y el cajón de "crítica" que había antes, a "para leer", ¿vale?

class RenameSections < ActiveRecord::Migration
  def self.up
    move_section "paraviajar", "websamigas"
    move_section "paraleer", "conferencias"
    move_section "critica", "paraleer"
  end

  def self.down
    undo_move_section "paraviajar", "websamigas"
    undo_move_section "paraleer", "conferencias"
    undo_move_section "critica", "paraleer"
  end

  def self.move_section(source, dest)
    Page.all(:conditions => {:section => source}).each do |p|
      p.update_attribute(:section, dest)
    end
    principal = Page.find_by_name(source)
    principal.update_attribute(:name, dest) if principal
  end

  def self.undo_move_section(source, dest)
    move_section(dest, source)
  end
end
