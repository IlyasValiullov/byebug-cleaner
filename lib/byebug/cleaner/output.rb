module ByebugCleaner
  def self.green_str string
    "\e[32m#{string}\e[0m"
  end

  def self.cyan_str string
    "\e[36m#{string}\e[0m"
  end
end