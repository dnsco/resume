require "date"
require "json"

class Job
  ATTRIBUTES = [:website, :start_date, :end_date, :title, :skills, :description]
  attr_accessor *ATTRIBUTES

  def initialize(company)
    @company = company
  end

  def to_hash
    {
      @company => ATTRIBUTES.inject({}) do |job, attribute|
        value = self.send(attribute)
        job.merge!(attribute => value.to_s.strip) if value
        job
      end
    }
  end
end

rails_dev = [:ruby, :pair_programming, :test_driven_development, :rails, :javascript, :jquery]
javascript_superstar = [:backbone, :coffeescript, :node]

internaut = Job.new("Internaut Design")
internaut.website = "http://internautdesign.com"
internaut.start_date = Date.parse("2009-6-1")
internaut.end_date = Date.parse("2010-1-15")
internaut.title = "Intern-Superstar"
internaut.skills = rails_dev
internaut.description = <<-DESCRIPTION
Learned Rails Development/Industry Best Practices by pairing with team members on the consultancy's
scrum project management tool "ScrumNinja", as well as client projects.
DESCRIPTION

circle_voting = Job.new("Circle Voting")
circle_voting.start_date = Date.parse("2010-1-15")
circle_voting.end_date = Date.parse("2010-10-1")
circle_voting.title = "Software Developer"
circle_voting.skills = rails_dev
circle_voting.description = <<-DESCRIPTION
Developed a social network around voting and civic activism for the 2010 mid-term elections.
DESCRIPTION


pivotal = Job.new("Pivotal Labs")
pivotal.website = "http://pivotallabs.com"
pivotal.start_date = Date.parse("2011-1-1")
pivotal.end_date = Date.parse("2011-12-31")
pivotal.title = "Agile Software Engineer"
pivotal.skills = [:pair_progamming, :test_driven_development, :team_building, :rails, :javascript, :consulting, :agile]
pivotal.description = <<-DESCRIPTION
Worked with Pivotal Labs to Develop applications for clients. The clients presented many different needs
such as having a team trained up, working with existing teams to refine practices and add horsepower,
help prioritize a sensible course of development for the business trajectory, and glitter.
DESCRIPTION

diaspora = Job.new("Diaspora")
diaspora.website = "https://joindiaspora.com"
diaspora.start_date = Date.parse("2012-1-1")
diaspora.end_date = Date.parse("2012-1-7")
diaspora.title = "Chief Magical Officer"
diaspora.skills = [:tech_lead, :scaling_rails, :lean_startuping, :javascript_superstardom, :fire_fighting]
diaspora.description = <<-DESCRIPTION
Diaspora is a distributed open source social network. On joining the core team was burdened with a heavy
operations cost, which was holding back development from being able to scale the platform effectively.
Through a separation of client and server side applications, server throughput was increased by an
order of magnitude. Development of the client as a Javascript Application (Backbone) allowed us to
rapidly iterate on experimental experiences. We delivered a completely different product
called Mark.io (https://makr.io/) on that utilized the existing server architecture.

Through a simplification of Infrastructure (removing unnecessary services and dependencies) we
were able to run Diaspora on the Heroku platform, allowing the developers/business owners to
work on the areas we could innovate, and outsource the non business critical sectors.
DESCRIPTION

blazing_cloud = Job.new("Blazing Cloud")
blazing_cloud.start_date = Date.parse("2012-11-15")
blazing_cloud.title = "Software Artisan"
blazing_cloud.skills = [:team_lead, :tech_lead, :agile_slash_lean, :team_building, :advanced_javascript_and_rails_wizardry]
blazing_cloud.description = <<-DESCRIPITON
Work with stake holders to help define products that fill a need.
Work with developers to build teams that make great software that fills actual business needs.
DESCRIPITON


resume = [blazing_cloud, diaspora, pivotal, circle_voting, internaut].inject({}) {|resume, job| resume.merge(job.to_hash)}

File.open("resume.json", 'w') { |file| file.write(JSON.pretty_generate(resume).gsub(/\\n/, "\n")) }