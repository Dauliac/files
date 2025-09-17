{ inputs, ... }:
{
  imports = [ inputs.files.flakeModules.default ];

  perSystem = psArgs: {
    treefmt.projectRoot = inputs.files;
    files = {
      gitToplevel = inputs.files;
      generateWriterApp = true;
    };
    make-shells.default.packages = [ psArgs.config.files.writer.drv ];
  };
}
