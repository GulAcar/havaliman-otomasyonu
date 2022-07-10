package application;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.stage.Stage;

public class rotalistSampleController {

   @FXML
   private Button devam;

   @FXML
   private Label birMarka;

   @FXML
   private Label ikiMarka;

   @FXML
   private Label ucMarka;

   @FXML
   private Label birKalkis;

   @FXML
   private Label ikiKalkis;

   @FXML
   private Label ucKalkis;

   @FXML
   private Label birVaris;

   @FXML
   private Label ikiVaris;

   @FXML
   private Label ucVaris;

   @FXML
   private Label birFiyat;

   @FXML
   private Label ikiFiyat;

   @FXML
   private Label ucFiyat;

   @FXML
   private RadioButton birSec;

   @FXML
   private RadioButton ikiSec;

   @FXML
   private RadioButton ucSec;

   int secim = 0;
   String fiyat = "";
   String nereden;
   String nereye;
   LocalDate gidistarihi;
   LocalDate donustarihi;
   boolean tekyon;
   boolean aktarmasiz;
   int yetiskin;
   int ogrenci;
   int cocuk;
   int bebek;

   //Baslangicta calisir...
   @FXML
   void initialize() {

   }

   @FXML
   void birSecClick(ActionEvent event) {
      ikiSec.setSelected(false);
      ucSec.setSelected(false);
      secim = 1;
      fiyat = ucFiyat.getText();
   }

   @FXML
   void ikiSecClick(ActionEvent event) {
      birSec.setSelected(false);
      ucSec.setSelected(false);
      secim = 2;
      fiyat = ikiFiyat.getText();
   }

   @FXML
   void ucSecClick(ActionEvent event) {
      birSec.setSelected(false);
      ikiSec.setSelected(false);
      secim = 3;
      fiyat = ucFiyat.getText();
   }

   @FXML
   void devamclick(ActionEvent event) {
      System.out.println(secim);
      if (this.secim == 0) {

         Alert alert = new Alert(AlertType.ERROR);
         alert.setTitle("Hata ");
         alert.setHeaderText("Lutfen Secim yapiniz");

         alert.showAndWait();

      } else if (secim != 0) {
         FXMLLoader loader = new FXMLLoader(getClass().getResource("odemeSample.fxml"));

         try {
            Parent root = loader.load();
            odemeSampleController odemeSampleController = loader.getController();
            odemeSampleController.Verigotur(this.secim, this.fiyat, this.nereden, this.nereye, this.gidistarihi, this.donustarihi, this.aktarmasiz, this.tekyon, this.yetiskin, this.ogrenci, this.cocuk, this.bebek);

            Stage stage = new Stage();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();

         } catch (IOException e) {
            e.printStackTrace();
         }
      }
   }

   public void Verigetir(String snereden, String snereye, LocalDate lgidistarihi, LocalDate ldonustarihi, boolean btekyon, boolean baktarmasiz, int syetiskin, int sogrenci, int scocuk, int sbebek) {

      nereden = snereden;
      nereye = snereye;
      gidistarihi = lgidistarihi;
      donustarihi = ldonustarihi;
      tekyon = btekyon;
      aktarmasiz = baktarmasiz;
      yetiskin = syetiskin;
      ogrenci = sogrenci;
      cocuk = scocuk;
      bebek = sbebek;

      boolean comp = false;
      ArrayList < String > Havaalani_adi = new ArrayList < String > ();
      ArrayList < String > Ucak_kalkis_saati = new ArrayList < String > ();
      ArrayList < String > Ucak_varis_saat = new ArrayList < String > ();
      ArrayList < String > Ucak_fiyat = new ArrayList < String > ();

      Connection conn = null;
      try {
         ObservableList < String > listacombo = FXCollections.observableArrayList();
         String SQL = "SELECT Havaalani_adi,Ucak_kalkis_saati,Ucak_varis_saat,fiyat from ucuslar where Ucak_kalkis_yer='" + snereden + "'AND Ucak_varis_yer='" + snereye + "'";

         conn = DriverManager.getConnection("jdbc:mysql://localhost/ucakotomasyonu", "root", "");
         PreparedStatement ps = conn.prepareStatement(SQL);
         ResultSet rs = ps.executeQuery();

         while (rs.next()) {
            Havaalani_adi.add(rs.getString("Havaalani_adi"));
            Ucak_kalkis_saati.add(rs.getString("Ucak_kalkis_saati"));
            Ucak_varis_saat.add(rs.getString("Ucak_varis_saat"));
            Ucak_fiyat.add(rs.getString("fiyat"));
         }
         comp = true;
      } catch (SQLException e) {
         e.printStackTrace();
         comp = false;
      }

      if (comp == true) {
         birMarka.setText(Havaalani_adi.get(0));
         ikiMarka.setText(Havaalani_adi.get(1));
         ucMarka.setText(Havaalani_adi.get(2));

         birKalkis.setText(Ucak_kalkis_saati.get(0));
         ikiKalkis.setText(Ucak_kalkis_saati.get(1));
         ucKalkis.setText(Ucak_kalkis_saati.get(2));

         birVaris.setText(Ucak_varis_saat.get(0));
         ikiVaris.setText(Ucak_varis_saat.get(1));
         ucVaris.setText(Ucak_varis_saat.get(2));

         birFiyat.setText(Ucak_fiyat.get(0) + " TL");
         ikiFiyat.setText(Ucak_fiyat.get(1) + " TL");
         ucFiyat.setText(Ucak_fiyat.get(2) + " TL");

      } else {
         birMarka.setVisible(false);
         ikiMarka.setVisible(false);
         ucMarka.setVisible(false);
         birKalkis.setVisible(false);
         ikiKalkis.setVisible(false);
         ucKalkis.setVisible(false);
         birVaris.setVisible(false);
         ikiVaris.setVisible(false);
         ucVaris.setVisible(false);
         birFiyat.setVisible(false);
         ikiFiyat.setVisible(false);
         ucFiyat.setVisible(false);

      }

   }

}