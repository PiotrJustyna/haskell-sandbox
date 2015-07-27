import Codec.Picture(PixelRGBA8( .. ), writePng)
import Graphics.Rasterific
import Graphics.Rasterific.Texture

main :: IO ()
main = do
    let backgroundColour = PixelRGBA8 234 247 217 255 -- Cilantro Creme
        foregroundColour1 = PixelRGBA8 195 214 170 255 -- Mint Sherbert
        foregroundColour2 = PixelRGBA8 142 168 108 255 -- Pesto Paste
        foregroundColour3 = PixelRGBA8 77 100 45 255 -- Simple Green
        foregroundColour4 = PixelRGBA8 40 58 16 255 -- Dark Water
        image = renderDrawing 400 400 backgroundColour $ do
            withTexture (uniformTexture foregroundColour1) . fill $ rectangle (V2 50 50) 145 145
            withTexture (uniformTexture foregroundColour2) . fill $ rectangle (V2 205 50) 145 145
            withTexture (uniformTexture foregroundColour3) . fill $ rectangle (V2 50 205) 145 145
            withTexture (uniformTexture foregroundColour4) . fill $ rectangle (V2 205 205) 145 145
    writePng "test.png" image

-- build with:
-- ghc -package-db=.cabal-sandbox\i386-windows-ghc-7.6.3-packages.conf.d main.hs
-- palette taken from: http://www.colourlovers.com/palette/110443/Summer_Grass
