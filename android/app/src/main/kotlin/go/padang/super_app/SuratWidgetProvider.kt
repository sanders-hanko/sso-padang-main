package go.padang.super_app

import es.antonborri.home_widget.HomeWidgetProvider
import android.content.Context
import android.appwidget.AppWidgetManager
import android.content.SharedPreferences
import android.widget.RemoteViews;
import java.util.Date
import java.util.Locale

class SuratWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.home_widget).apply {
                val masuk = widgetData.getString("jam_masuk", "-")
                val pulang = widgetData.getString("jam_pulang", "-")
                val currentDate = java.text.SimpleDateFormat("dd MMMM yyyy", Locale("id", "ID")).format(Date())
                setTextViewText(R.id.widget_text_tanggal, currentDate)
                setTextViewText(R.id.widget_text_masuk, masuk)
                setTextViewText(R.id.widget_text_pulang, pulang)
            }
            // This line is important to trigger the update
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
