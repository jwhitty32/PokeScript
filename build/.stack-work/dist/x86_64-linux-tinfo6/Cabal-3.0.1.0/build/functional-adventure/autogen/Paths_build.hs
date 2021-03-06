{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_build (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/bin"
libdir     = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/lib/x86_64-linux-ghc-8.8.4/build-0.1.0.0-KjPgTdeoaANBnSSn9KFuEM-functional-adventure"
dynlibdir  = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/share/x86_64-linux-ghc-8.8.4/build-0.1.0.0"
libexecdir = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/libexec/x86_64-linux-ghc-8.8.4/build-0.1.0.0"
sysconfdir = "/home/jdw23/PokeScript/build/.stack-work/install/x86_64-linux-tinfo6/ac0bd1a61ad5fbea6e48a8c5aff1a61223eef932ce95125760b8a3ec0a3f11f5/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "build_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "build_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "build_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "build_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "build_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "build_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
