{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Root
  ( rootModule
  ) where

import           Text.Edifact.Scaffolder.Commons

rootModule :: Scaffolding ()
rootModule = getRootModuleName >>= generateRootModule

generateRootModule :: ModuleName -> Scaffolding ()
generateRootModule mn =
  let exports = [ reexportAlias subModulesAlias ]
      subModulesAlias = "S"
      importSubModule sm = ImportAll (ImportAs (mn <.> sm) subModulesAlias)
      subModules = [ "Composites"
                   , "Messages"
                   , "Segments"
                   ]
      imports = [ ImportGroup (importSubModule <$> subModules) ]
  in
    saveHaskellModule mn $
      moduleDeclaration mn exports imports
