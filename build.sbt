import sbtunidoc.BaseUnidocPlugin.autoImport.*
import sbtunidoc.ScalaUnidocPlugin

scalaVersion := "3.8.4"

lazy val `scala-config-root` = project
  .in(file("."))
  .aggregate()
  .enablePlugins(ScalaUnidocPlugin)
