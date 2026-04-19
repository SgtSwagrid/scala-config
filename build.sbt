import sbtunidoc.BaseUnidocPlugin.autoImport.*
import sbtunidoc.ScalaUnidocPlugin

scalaVersion := "3.8.3"

lazy val `scala-config-root` = project
  .in(file("."))
  .aggregate()
  .enablePlugins(ScalaUnidocPlugin)
