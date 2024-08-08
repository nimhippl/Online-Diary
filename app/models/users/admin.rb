module Users
  class Admin < User
    def admin?
      true
    end

    def teacher?
      false
    end
  end
end
