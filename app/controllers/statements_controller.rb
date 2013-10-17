require 'csv'
class StatementsController < ApplicationController
  def index

  end

  def new
  end

  def create
    Statement.where(id: 5).sum()
    puts "Received file"
    file = params[:file]
    puts "Processing file"
    rows = []
    CSV.foreach(file.path, headers: true) do |row|
      rows << row.to_hash
    end
    sum = 0
    rows.each do{ |row| sum += row[:number] }
    puts sum
    render 'test_view'
  end

end