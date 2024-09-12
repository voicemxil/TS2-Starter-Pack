/*
 * Graphics Rules Maker
 * Copyright (C) 2020 Wouter Haffmans <wouter@simply-life.net>
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
 */

#ifndef MESSAGEHANDLER_H
#define MESSAGEHANDLER_H

#include <QtCore/QObject>
#include "graphicsrulesmaker_config.h"

/**
 * @todo write docs
 */
class GRAPHICSRULESMAKER_EXPORT MessageHandler : public QObject
{
    Q_OBJECT

public:
    /**
     * Constructor
     */
    explicit MessageHandler(const QString& destination, QObject* parent = nullptr);
    ~MessageHandler();

    static void setMessagePattern();
    void install();
    void uninstall();

private:
    static void handleMessage(QtMsgType type, const QMessageLogContext& context, const QString& message);
    void writeMessage(QtMsgType type, const QMessageLogContext& context, const QString& message);
    void rotate(int keep);
    QString backupFile(int n) const;

    QString m_destination;
    static MessageHandler* m_active_instance;
    MessageHandler* m_previous_instance;
    QtMessageHandler m_previous_handler;

};

#endif // MESSAGEHANDLER_H
