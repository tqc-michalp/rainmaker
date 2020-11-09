# frozen_string_literal: true

class User::Xls
  def initialize(users)
    @users = users
  end

  def execute
    add_rows
    to_stream
  end

  private

  attr_reader :users

  def parser
    @parser ||= Axlsx::Package.new
  end

  def workbook
    parser.workbook
  end

  def worksheet
    @worksheet ||= workbook.add_worksheet(name: 'users')
  end

  def add_rows
    users.each do |user|
      worksheet.add_row(user.slice(:id, :first_name, :last_name).values)
    end
  end

  def to_stream
    parser.to_stream.read
  end
end
