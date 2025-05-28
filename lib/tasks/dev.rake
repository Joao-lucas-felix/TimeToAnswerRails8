namespace :dev do
  DEFAULT_PASSWORD = 123456
  DEFAULT_FILE_PATH = File.join(Rails.root, 'lib', 'tmp')


 desc "Config the dev environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner "Dropping the DB...", "  (Done!)" do
        %x( rails db:drop)
      end
      show_spinner "Creating the DB...", " (Done!)" do
        %x( rails db:create)
      end

      show_spinner "Migrating the DB...", "(Done!)" do
        %x( rails db:migrate)
      end

      show_spinner "Adding a default admin in the DB...", "  (Done!)" do
        %x( rails dev:add_default_admin)
      end 
      show_spinner "Adding a default user in the DB...", "  (Done!)" do
        %x( rails dev:add_default_user)
      end
    else
       puts "You should be in dev environment to do this task"
    end
  end
  desc "Adds a default admin in the database"
  task add_default_admin: :environment do 
    if Rails.env.development?
      Admin.create!( 
        email: 'admin@admin.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
       )
    end
  end
    desc "Adds a default user in the database"
  task add_default_user: :environment do 
    if Rails.env.development?
      User.create!( 
        #first_name: 'user',
        #last_name: 'user',
        email: 'user@user.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
       )
    end
  end


  private
  def show_spinner msg_start, msg_end
    spinner = TTY::Spinner.new "[:spinner] #{msg_start}", format: :bouncing_ball
    spinner.auto_spin
    yield
    spinner.success "#{msg_end}"
  end
end
