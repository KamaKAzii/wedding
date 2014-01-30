class Permission

  def initialize(current_user)
    allow :home, [:index]
    allow :sessions, [:new, :create, :destroy]
    allow :users, [:new, :create]
    if current_user
      allow :users, [:show] do |user|
        user.id == current_user.id
      end

      allow :consumer_contacts, [:new, :create]
      allow :consumer_contacts, [:edit, :update] do |cc|
        cc.user.id == current_user.id
      end

      allow :service_contacts, [:new, :create]
      allow :service_contacts, [:edit, :update] do |sc|
        sc.user.id == current_user.id
      end

      allow :marriages, [:new, :create]
      allow :marriages, [:edit, :update] do |marriage|
        marriage.user.id = current_user.id
      end

      allow :jobs, [:new, :create, :theme_search, :tag_search, :keyword_search]
      allow :jobs, [:edit, :update] do |job|
        job.marriage.user.id == current_user.id
      end

      allow :events, [:new, :create]

      allow :posts, [:new, :create]

      allow :invites, [:new, :create]

      allow :photos, [:new, :create]

      allow :appointments, [:new, :create]
      allow :appointments, [:edit, :update] do |app|
        app.user.id == current_user.id
      end
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  private

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

end
