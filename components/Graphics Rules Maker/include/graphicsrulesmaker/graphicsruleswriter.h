#ifndef GRAPHICSRULESWRITER_H
#define GRAPHICSRULESWRITER_H

#include <QObject>
#include <QDir>
#include <memory>

#include "videocarddatabase.h"
#include "graphicsrulesmaker_config.h"

class GameWriterInterface;
class GameWriterFactory;
class VideoCardDatabase;
class QSettings;

/**
 * This manages the active plugin, writes graphics rules files etc.
 */
class GRAPHICSRULESMAKER_EXPORT GraphicsRulesWriter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(GameWriterInterface* plugin READ plugin NOTIFY pluginLoaded)
    Q_PROPERTY(VideoCardDatabase* videoCardDatabase READ videoCardDatabase CONSTANT)
    Q_PROPERTY(QDir gamePath READ gamePath WRITE setGamePath NOTIFY gamePathChanged)
    Q_PROPERTY(QVariantMap currentSettings READ currentSettings WRITE saveSettings NOTIFY currentSettingsChanged)

public:
    GraphicsRulesWriter(GameWriterFactory* factory, VideoCardDatabase* cardDatabase, QObject* parent = nullptr);
    ~GraphicsRulesWriter();

    GameWriterInterface* plugin() const;
    VideoCardDatabase* videoCardDatabase() const;

    QDir gamePath() const;
    void setGamePath(const QDir& path);

    QVariantMap currentSettings() const;

public slots:
    bool loadPlugin(const QString& gameId);
    bool createBackups();
    bool createBackupsAt(const QDir& destination);
    bool writeFiles(const QVariantMap& settings);
    bool writeFiles(const QDir& destination, const QVariantMap& settings);

    void saveSettings(const QVariantMap& settings);

signals:
    void pluginLoaded(const QString& gameId);
    void gamePathChanged(const QDir& gamePath);
    void currentSettingsChanged(const QVariantMap& settingsMap);

private:
    // Helpers with split destinations (they'll usually be the same, but could technically be different)
    bool backupTo(const QDir& graphicsRulesDestinationDir, const QDir& videoCardsDestinationDir);
    bool writeFilesTo(const QDir& graphicsRulesDestinationDir, const QDir& videoCardsDestinationDir, const QVariantMap& settings);

    void recursiveSaveSettings(const QVariantMap& map, QSettings* settings) const;
    void loadSettings();
    QVariantMap recursiveLoadSettings(QSettings* settings);

    GameWriterFactory* m_factory;
    GameWriterInterface* m_plugin;
    VideoCardDatabase* m_cardDatabase;
    QDir m_gamePath;
    QVariantMap m_currentSettings;
};

#endif // GRAPHICSRULESWRITER_H
