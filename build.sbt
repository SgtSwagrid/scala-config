import sbtunidoc.BaseUnidocPlugin.autoImport.*
import sbtunidoc.ScalaUnidocPlugin

scalaVersion := "3.10.1"

lazy val `scala-config-root` = project
  .in(file("."))
  .aggregate()
  .enablePlugins(ScalaUnidocPlugin)
