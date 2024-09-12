/*
 * Graphics Rules Maker
 * Copyright (C) 2014-2021 Wouter Haffmans <wouter@simply-life.net>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#ifndef GAMEWRITER_H
#define GAMEWRITER_H

#include <QtCore/QString>
#include <QtCore/QFileInfo>
#include <QtCore/QDir>

#include "graphicsrulesmaker_config.h"

class QIODevice;
class AbstractSettingsWidget;
class DeviceModel;
class VideoCardDatabase;

class GRAPHICSRULESMAKER_EXPORT GameWriterInterface
{
public:
    /**
     * Return the constant technical name of the game.
     *
     * This will be used to group global settings.
     */
    virtual QString id() const = 0;

    /**
     * Return the (translated) display name of the game.
     */
    virtual QString displayName() const = 0;

    /**
     * Construct a new settings widget. This will be embedded in the UI.
     *
     * You should use the widget to load/store settings of previous runs.
     */
    virtual AbstractSettingsWidget *settingsWidget(DeviceModel *devices, VideoCardDatabase *database, QWidget *parent = 0) = 0;

    /**
     * Find the game's default directory.
     *
     * This will be used if no path was set by the user in an earlier session.
     */
    virtual QDir findGameDirectory() const = 0;

    /**
     * The default file name of the Graphic Rules.sgr file.
     */
    virtual QString rulesFileName() const = 0;

    /**
     * The file name of the Graphic Rules.sgr file.
     */
    virtual QFileInfo rulesFileName(const QDir& gameDirectory) const = 0;

    /**
     * The default file name of the Video Cards.sgr file.
     */
    virtual QString databaseFileName() const = 0;

    /**
     * The file name of the Video Cards.sgr file.
     */
    virtual QFileInfo databaseFileName(const QDir& gameDirectory) const = 0;

    /**
     * The game's default executable file.
     */
    virtual QString gameExecutable() const = 0;

    /**
     * The game's executable file.
     *
     * This will be used to launch a test run of the game.
     */
    virtual QFileInfo gameExecutable(const QDir &gameDirectory) const = 0;

    /**
     * Write the graphics rules to the given device.
     */
    virtual void write(const QVariantMap& settings, QIODevice *target) = 0;

    /**
     * Destructor
     */
    virtual ~GameWriterInterface() {};
};

Q_DECLARE_INTERFACE(GameWriterInterface, "com.simsnetwork.GameWriterInterface");

#endif // GAMEWRITER_H
