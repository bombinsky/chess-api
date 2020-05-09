# frozen_string_literal: true

RSpec::Matchers.define :receive_call do
  match do |service|
    @double = instance_double(service)

    if @args
      expect(service).to receive(:new).with(*@args).and_return @double
    else
      expect(service).to receive(:new).and_return @double
    end

    if @return_value
      allow(@double).to receive(:call).and_return @return_value
    elsif @raise_args
      allow(@double).to receive(:call).and_raise @raise_args
    else
      allow(@double).to receive(:call)
    end
  end

  match_when_negated do |service|
    if @args
      expect(service).not_to receive(:new).with(*@args)
    else
      expect(service).not_to receive(:new)
    end
  end

  chain :with do |*args|
    @args = args
  end

  chain :and_return do |return_value|
    @return_value = return_value
  end

  chain :and_raise do |*args|
    @raise_args = args
  end
end
