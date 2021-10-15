require 'rails_helper.rb'


# from source https://github.com/rails/rails/issues/34790
if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe MoviesController do
  before do
    @example = Movie.create :title=>'examp', :rating=>'G', :director=>'Sicheng', :release_date=>'1-Jan-2021'
  end
    describe 'new' do
        it 'should render new view' do
            get :new
            expect(response).to render_template('new')
        end
    end
    
    describe 'show' do
        it 'should show detail' do
            get :show,:id=>@example.id
            expect(response).to render_template('show')
            expect(assigns[:movie]).to eq @example
        end
    end
    
    describe 'create' do
        it 'create new movie' do 
            put :create, :movie=> {title: 'new_movie'}
            expect(assigns[:movie].title).to eq 'new_movie'
        end
    end
    describe 'destory' do
        it 'delete movie and redirect to page' do 
            put :destroy, :id=>@example.id
            expect(response).to redirect_to(movies_path)
        end
    end
end