package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class odemeSampleController {

   @FXML
   private TextField emailLabel;

   @FXML
   private TextField cepLabel;

   @FXML
   private TextField AdLabel;

   @FXML
   private TextField soyadLabel;

   @FXML
   private TextField tcLabel;

   @FXML
   private TextField dogumTarLabel;

   @FXML
   private RadioButton KadinRb;

   @FXML
   private RadioButton erkekRb;

   @FXML
   private TextField HesLabel;

   @FXML
   private TextField kartnoLabel;

   @FXML
   private TextField sonkullanmaLabel;

   @FXML
   private TextField cvvLabel;

   @FXML
   private Button btn_ode;

   @FXML
   private Label fiyatLabl;

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

   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
   static final String DB_URL = "jdbc:mysql://localhost/ucakotomasyonu";
   static final String USER = "root";
   static final String PASS = "";

   @FXML
   void btn_ode_click(ActionEvent event) {
      if (emailLabel.getText() == null || cepLabel.getText() == null || AdLabel.getText() == null && soyadLabel.getText() == null && tcLabel.getText() == null && dogumTarLabel.getText() == null && HesLabel.getText() == null && kartnoLabel.getText() == null && sonkullanmaLabel.getText() == null && cvvLabel.getText() == null) {
         Alert alert = new Alert(AlertType.ERROR);
         alert.setTitle("Hata ");
         alert.setHeaderText("Gerekli Yerleri doldurunuz!!!");
         alert.showAndWait();
      } else {
         Alert alert = new Alert(AlertType.INFORMATION);
         alert.setTitle("Odeme islemi tamamlandi");
         alert.setHeaderText("Odeme islemi basariyla gerceklesti");
         alert.setContentText("Iyi yolculuklar dileriz");
         alert.showAndWait();

         Connection conn = null;
         Statement stmt = null;
         try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String sql = "INSERT INTO fatura VALUES (" + AdLabel.getText().toString() + "," + soyadLabel.getText().toString() + ", " + emailLabel.getText().toString() + "," + Integer.valueOf(tcLabel.getText()) + "," + HesLabel.getText() + "," + Integer.valueOf(kartnoLabel.getText()) + "," + sonkullanmaLabel.getText() + "," + Integer.valueOf(cvvLabel.getText()) + "," + nereden + "," + nereye + "," + gidistarihi + "," + donustarihi + "," + yetiskin + "," + ogrenci + "," + cocuk + "," + bebek + " )";
            stmt.executeUpdate(sql);
         } catch (SQLException se) {
            se.printStackTrace();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (stmt != null)
                  conn.close();
            } catch (SQLException se) {}
            try {
               if (conn != null)
                  conn.close();
            } catch (SQLException se) {
               se.printStackTrace();
            }
         }
      }
   }

   public void Verigotur(int secim, String fiyat, String snereden, String snereye, LocalDate lgidistarihi, LocalDate ldonustarihi, boolean baktarmasiz, boolean btekyon, int syetiskin, int sogrenci, int scocuk, int sbebek) {

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

      fiyatLabl.setText(fiyat);

   }

}