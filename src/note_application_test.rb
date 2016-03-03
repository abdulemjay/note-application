require_relative 'note_application'
include Emjay


RSpec.describe "NotesApplication" do
  context "author of the note instantiation" do

    it "should test for empty author name" do
    expect {NotesApplication.new("")}.to raise_error "Please enter valid author name"
    end    
      
    it "should test for integer" do
     expect {NotesApplication.new(4)}.to raise_error "Please enter valid author name"
    end  

    it "should test for float" do
     expect {NotesApplication.new(1.4)}.to raise_error "Please enter valid author name"
    end

    it "should test for nil" do
     expect {NotesApplication.new(nil)}.to raise_error "Please enter valid author name"
    end

  end

  context 'checks for several instances of initialize method' do 
    noteemjay = NotesApplication.new("Emjay")
    notebukky = NotesApplication.new("Bukky")
    noteyetty = NotesApplication.new("Yetty")

    it 'should return author name Emjay' do
        expect(noteemjay.author).to eq 'Emjay'
    end

    it 'should reutrn author name Bukky' do
        expect(notebukky.author).to eq 'Bukky'
    end

    it 'should reutrn author name Yetty' do
        expect(noteyetty.author).to eq 'Yetty'
    end

  end

  context 'checks if notes is an instance property' do
    newnote = NotesApplication.new("Emjay")

    it 'should returns notes list to be empty' do
        expect(newnote.list).to eq []
    end

  end

  context "Checks if method" do
    newauthor = NotesApplication.new("Emjay")
    newauthor.create("Andela is all about Fellowship")
    newauthor.create("What an interesting Bootcamp")
    newauthor.create("Andela is wonderful")
    newauthor.create("Ruby is weird")

    it 'returns name of author' do 
        expect(newauthor.author).to eq "Emjay"
    end

    it 'returns notes with index 0' do
        expect(newauthor.get(0)).to eq "Andela is all about Fellowship"
    end

    it 'returns notes with index 1' do
        expect(newauthor.get(1)).to eq "What an interesting Bootcamp"
    end

    it 'returns notes with index 2' do
        expect(newauthor.get(2)).to eq "Andela is wonderful"
    end

    it 'returns notes with index 3' do
        expect(newauthor.get(3)).to eq "Ruby is weird"
    end
    
    it 'should check if note_id is not an integer' do
        expect {newauthor.get("one")}.to raise_error "Note ID should be an Integer"
    end

    it 'edit returns error if get first parameter i.e note_id is not an integer' do 
        expect {newauthor.edit("zero","Who says Ruby is interesting")}.to raise_error "Note Id should be an Integer"
    end

    it 'edit edit the the note given the index and the new content' do
        expect {newauthor.edit(0,"Who says Ruby is interesting")}.to change {newauthor.get(0)}. from("Andela is all about Fellowship").to("Who says Ruby is interesting")
    end

    it 'delete raise error if note_id is a string' do
        expect {newauthor.delete("1")}.to raise_error "Note Id should be an Integer"
    end
    it 'delete delete note at index 2' do
        expect {newauthor.delete(3)}.to change {newauthor.notes.length}.from(4).to(3)
    end

    it 'set should return note at index 2' do
        expect(newauthor.get(2)).to eq "Andela is wonderful"
    end

  end

end