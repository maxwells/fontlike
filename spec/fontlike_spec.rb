require 'fontlike'
require 'unicode_utils'

INPUT = "What do you think, mr fancy pants?"

describe Fontlike::Transmuter do
  let(:transmuter) { Fontlike::Transmuter.new(opts) }
  let(:opts) { {} }
  let(:output) { transmuter.transmute(INPUT) }

  describe 'with fancy flag' do
    let(:opts) { { style: :fancy } }

    it 'outputs some fancy text' do
      expect(output).to eq("𝓦𝓱𝓪𝓽 𝓭𝓸 𝔂𝓸𝓾 𝓽𝓱𝓲𝓷𝓴, 𝓶𝓻 𝓯𝓪𝓷𝓬𝔂 𝓹𝓪𝓷𝓽𝓼?")
    end
  end

  describe 'with shout flag' do
    let(:opts) { { style: :shout } }

    it 'outputs some shout text' do
      expect(output).to eq("WHAT DO YOU THINK, MR FANCY PANTS?")
    end
  end

  describe 'with mono flag' do
    let(:opts) { { style: :mono } }

    it 'outputs some mono text' do
      expect(output).to eq("𝚆𝚑𝚊𝚝 𝚍𝚘 𝚢𝚘𝚞 𝚝𝚑𝚒𝚗𝚔, 𝚖𝚛 𝚏𝚊𝚗𝚌𝚢 𝚙𝚊𝚗𝚝𝚜?")
    end
  end

  describe 'with sans_serif flag' do
    let(:opts) { { style: :sans_serif } }

    it 'outputs some sans_serif text' do
      expect(output).to eq("𝖶𝗁𝖺𝗍 𝖽𝗈 𝗒𝗈𝗎 𝗍𝗁𝗂𝗇𝗄, 𝗆𝗋 𝖿𝖺𝗇𝖼𝗒 𝗉𝖺𝗇𝗍𝗌?")
    end
  end

  describe 'with double_struck flag' do
    let(:opts) { { style: :double_struck } }

    it 'outputs some double_struck text' do
      expect(output).to eq("𝕎𝕙𝕒𝕥 𝕕𝕠 𝕪𝕠𝕦 𝕥𝕙𝕚𝕟𝕜, 𝕞𝕣 𝕗𝕒𝕟𝕔𝕪 𝕡𝕒𝕟𝕥𝕤?")
    end
  end

  describe 'with random flag' do
    let(:opts) { { style: :random } }

    it 'outputs some random text' do
      expect(UnicodeUtils.display_width(output)).to eq(UnicodeUtils.display_width(INPUT))
    end
  end

  describe 'with no flag' do
    it 'outputs some double_struck text' do
      expect(output).to eq("𝕎𝕙𝕒𝕥 𝕕𝕠 𝕪𝕠𝕦 𝕥𝕙𝕚𝕟𝕜, 𝕞𝕣 𝕗𝕒𝕟𝕔𝕪 𝕡𝕒𝕟𝕥𝕤?")
    end
  end
end
