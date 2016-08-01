module Paths_HTTP (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Piotr\\Documents\\haskell-sandbox\\ExternalLibraries\\HTTP\\.stack-work\\install\\72e7e322\\bin"
libdir     = "C:\\Users\\Piotr\\Documents\\haskell-sandbox\\ExternalLibraries\\HTTP\\.stack-work\\install\\72e7e322\\lib\\x86_64-windows-ghc-7.10.3\\HTTP-0.1.0.0-9NyspanZVc49OaRmXXSz67"
datadir    = "C:\\Users\\Piotr\\Documents\\haskell-sandbox\\ExternalLibraries\\HTTP\\.stack-work\\install\\72e7e322\\share\\x86_64-windows-ghc-7.10.3\\HTTP-0.1.0.0"
libexecdir = "C:\\Users\\Piotr\\Documents\\haskell-sandbox\\ExternalLibraries\\HTTP\\.stack-work\\install\\72e7e322\\libexec"
sysconfdir = "C:\\Users\\Piotr\\Documents\\haskell-sandbox\\ExternalLibraries\\HTTP\\.stack-work\\install\\72e7e322\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HTTP_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HTTP_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HTTP_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HTTP_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HTTP_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
