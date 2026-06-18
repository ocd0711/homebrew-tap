cask "loon" do
  version "0.2.0,60"
  sha256 "5dbe407bf798caa5ca7975b3ee4e8c01122515ad03eda14664dc4ba11ca75444"

  url "https://github.com/Loon0x00/Loon4Mac/releases/download/#{version.csv.first}%28#{version.csv.second}%29/Loon-#{version.csv.first}-beta-#{version.csv.second}.dmg",
      verified: "github.com/Loon0x00/Loon4Mac/"
  name "Loon"
  desc "Network proxy tool"
  homepage "https://github.com/Loon0x00/Loon4Mac"

  livecheck do
    url :url
    strategy :github_latest do |json|
      match = json["tag_name"]&.match(/
        ^v?(\d+(?:\.\d+)+)\((\d+)\)$
      /x)

      "#{match[1]},#{match[2]}" if match
    end
  end

  depends_on macos: :big_sur

  app "Loon.app"

  uninstall quit: "com.loon.Loon"
end
