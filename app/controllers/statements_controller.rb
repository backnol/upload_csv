require 'csv'
class StatementsController < ApplicationController
  def index

  end

  def new
  end

  def create
    puts "Received file"
    file = params[:file]
    puts "Processing file"
    @rows = []
    CSV.foreach(file.path, headers: true) do |row|
      @rows << row.to_hash
    end
    puts @rows.count
    puts @rows
    sum = 0
    @rows.each { |row| sum += row['number'].to_i }
    puts sum

    puts 'Parsing the words that are split by comma'
    @words = params[:words].split(',')
    
    render 'test_view'
  end

end