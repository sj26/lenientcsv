require "spec_helper"

describe LenientCSV do
  let(:csv) { %{one,"two",\n"fo""ur","fi\\"ve","si\\\\x"} }

  subject(:reader) { LenientCSV.new(csv) }

  specify do
    expect(reader.to_a).to eq([["one", "two", ""], [%{fo"ur}, %{fi"ve}, %{si\\x}]])
  end
end
