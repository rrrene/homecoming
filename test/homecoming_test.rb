require File.expand_path(File.dirname(__FILE__) + '/test_helper')

describe ::Homecoming do
  it "should find both .yourconfig files" do
    Dir.chdir File.join(fixture_path(:simple), "projects", "your_project")
    list = Homecoming.find(".yourconfig")
    here = File.dirname(__FILE__)
    assert_equal ["#{here}/fixtures/simple/.yourconfig", "#{here}/fixtures/simple/projects/your_project/.yourconfig"], list
  end

  it "should find both config/settings.yml files" do
    Dir.chdir File.join(fixture_path(:simple), "projects", "your_project")
    list = Homecoming.find("config/settings.yml")
    here = File.dirname(__FILE__)
    assert_equal ["#{here}/fixtures/simple/config/settings.yml", "#{here}/fixtures/simple/projects/your_project/config/settings.yml"], list
  end

  it "should find both .yourconfig files" do
    Dir.chdir File.join(fixture_path(:simple), "projects", "your_project")
    list = []
    Homecoming.each do |dir|
      list << dir
    end
    assert_equal Dir.pwd, list.first
    assert_equal "/", list.last
    assert_equal Dir.pwd.split('/').size, list.size
    # directories in the list are getting shorter (getting closer to home)
    assert_equal list.sort_by(&:size), list.reverse
  end
end
