require_relative '../lib/books_repository'
require_relative '../lib/book'

RSpec.describe BooksRepository do

    def reset_books_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end
    
    # describe BooksRepository do
    before(:each) do
        reset_books_table
    end

    it 'Returns a list of book titles and authors' do

        repo = BooksRepository.new
        books = repo.all
        expect(books.length).to eq(5) # => 5
        expect(books.first.id).to eq('1') # => '1'
        expect(books.first.title).to eq('Nineteen Eighty-Four') # => Nineteen Eighty-Four 
        expect(books.first.author_name).to eq('George Orwell') # George Orwell
    end
end