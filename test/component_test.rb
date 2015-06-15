require 'helper'

module FooBar
  def self.bs_panel_title(locals = {}, scope = nil)
    firstline = locals.fetch(:line, 'h4.panel-title')
    builder = locals.fetch(:builder, Slim::Builder::Component)
    builder.build firstline, scope do |b|
      %Q{
  i.fa.fa-list-alt.pull-left
  = obj.header

  span.pull-right
    = obj.rhs
    .badge
      = obj.header_count
}
    end
  end

  def self.bs_panel(locals = {}, scope = nil)
    locals.fetch(:builder, Slim::Builder::Component).build '.panel.panel-success', scope do |b|
      %Q{
  .panel-heading
    #{bs_panel_title(locals.update(builder: b))}
  #{block_given? ? yield() : ''}
  - if obj.show_footer?
    .panel-footer
      = obj.footer
}
    end
  end
end

class Obj
  def header() 'some header'; end
  def header_count() 3; end
  def rhs() 'right hand side'; end
  def show_footer?() true; end
  def footer() 'some footer'; end
end

class Env
  def obj() @obj ||= Obj.new; end
end

describe 'slim/builder' do
  let(:component) { Slim::Builder::Component.new }
  let(:slim) { '.foo.bar' }
  let(:inner_block) { ->(bldr) { '|baz' } }
  
  it 'it generates an HTML snippet from a slim line' do
    actual = component.compile(slim, &inner_block).finalize(self)
    expect(actual).must_equal '<div class="foo bar">baz</div>'
  end

  it 'generates html from a module' do
    expected = "<div class=\"panel panel-success\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><i class=\"fa fa-list-alt pull-left\"></i>some header<span class=\"pull-right\">right hand side<div class=\"badge\">3</div></span></h4></div><ham>and cheese</ham><div class=\"panel-footer\">some footer</div></div>"
    actual = FooBar.bs_panel({}, Env.new) { 'ham and cheese' }
    expect(actual).must_equal expected
  end
end
